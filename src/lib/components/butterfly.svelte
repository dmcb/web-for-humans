<!--
Auto-generated by: https://github.com/threlte/threlte/tree/main/packages/gltf
Command: npx @threlte/gltf@3.0.0 butterfly.glb --transform --types
-->

<script lang="ts">
	import type * as THREE from 'three';
	import { Vector3, CatmullRomCurve3 } from 'three';
	import { T, useTask } from '@threlte/core';
	import { useGltf, useDraco, onReveal } from '@threlte/extras';

	interface Props {
		perchPoints: [number, number, number][];
		shookPerch: number;
	}

	let { perchPoints, shookPerch }: Props = $props();

	type GLTFResult = {
		nodes: {
			Plane018: THREE.Mesh;
			Cylinder001: THREE.Mesh;
			Sphere002: THREE.Mesh;
			NurbsPath_1: THREE.Mesh;
			Plane021: THREE.Mesh;
			Cylinder020_1: THREE.Mesh;
		};
		materials: {};
	};

	const dracoLoader = useDraco();
	const gltf = useGltf<GLTFResult>('/glb/butterfly.glb', { dracoLoader });

	let flightPath = new CatmullRomCurve3();
	let ref: THREE.Group | undefined;
	let leftwing: THREE.Mesh | undefined;
	let rightwing: THREE.Mesh | undefined;
	let flightTime = 0;
	let state = 'Perched';
	let targetPerch = -1;
	let perch = -1;
	let position = [0, 5, -0.2] as [number, number, number];
	let restingWingFlaps = 0;
	let restingWingFlapSpeed = 0;

	function interpolatePoint(p1: Vector3, p2: Vector3, t: number, jitter: number): Vector3 {
		const x = p1.x + (p2.x - p1.x) * t + (Math.random() - 0.5) * jitter;
		const y = p1.y + (p2.y - p1.y) * t + (Math.random() - 0.5) * jitter;
		const z = 2; // Butterfly will fly in front of the words
		return new Vector3(x, y, z);
	}

	function setFlightPath(target: [number, number, number], points: number, jitter: number) {
		const originPoint = new Vector3(position[0], position[1], position[2]);
		const targetPoint = new Vector3(target[0], target[1], target[2]);
		let pointsValues = [];
		for (let i = 0; i < points; i++) {
			const point = interpolatePoint(originPoint, targetPoint, i / (points + 1), jitter);
			pointsValues.push(point);
		}
		flightPath = new CatmullRomCurve3(
			[originPoint, ...pointsValues, targetPoint],
			false,
			'catmullrom',
			0.9
		);
	}

	function easeOutQuad(x: number): number {
		return 1 - (1 - x) * (1 - x);
	}

	function easeInOutSine(x: number): number {
		return -(Math.cos(Math.PI * x) - 1) / 2;
	}

	$effect(() => {
		if (shookPerch != -1) {
			if (state == 'Perched' && shookPerch == perch) {
				console.log('Butterfly leaving perch', perch);
				switchState('LeavingPerch');
			} else if (state == 'FlyingToPerch' && shookPerch == targetPerch) {
				console.log('Butterfly holding');
				switchState('HoldPattern');
			}
		}
	});

	onReveal(() => {
		setTimeout(() => {
			switchState('FlyingToPerch');
		}, 1000);
	});

	function switchState(newState: 'Perched' | 'LeavingPerch' | 'HoldPattern' | 'FlyingToPerch') {
		console.log('Switching state to', newState);
		state = newState;
		flightTime = 0;
		switch (state) {
			case 'Perched':
				perch = targetPerch;
				console.log('Perched on perch', perch);
				break;
			case 'LeavingPerch':
				// Fly in front of the words
				setFlightPath(
					[position[0] + (Math.random() - 0.5) * 2, position[1] + (Math.random() - 0.5) * 2, 2],
					0,
					0
				);
				break;
			case 'HoldPattern': {
				// Fly in a random tight pattern around the current location
				setFlightPath(position, 5, 0.8);
				break;
			}
			case 'FlyingToPerch':
				// Fly in a lose pattern to a random perch, unless it's the shook perch
				do {
					targetPerch = Math.floor(Math.random() * perchPoints.length);
				} while (targetPerch == shookPerch);
				setFlightPath(perchPoints[targetPerch], 2, 1.8);
				break;
		}
	}

	useTask((delta) => {
		if (ref) {
			// Get flap pulse by measuring when sine wave crosses 0
			if (Math.sin(Date.now() * 0.01) > 0 && Math.sin((Date.now() - delta * 1000) * 0.01) < 0) {
				// Random chance to flap wings when perched, or fly to another perch
				if (restingWingFlaps > 0) {
					restingWingFlaps--;
				} else if (state == 'Perched') {
					if (Math.random() < 0.2) {
						restingWingFlaps = 1;
						restingWingFlapSpeed = Math.random() * 0.8 + 0.2;
					} else if (Math.random() < 0.05) {
						switchState('FlyingToPerch');
					}
				}
			}

			// Get speed of butterfly based on position change
			const positionDiff = new Vector3(position[0], position[1], position[2]).sub(ref.position);
			let speed = 0.05 + positionDiff.length() / delta;
			position = [ref?.position.x, ref?.position.y, ref?.position.z];

			// Flap wings
			let wingFlapSpeed = speed * 0.4;
			if (state == 'Perched' && restingWingFlaps > 0) {
				wingFlapSpeed += restingWingFlapSpeed;
			}
			const wingRotation = Math.abs(Math.sin(Date.now() * 0.01)) * wingFlapSpeed;
			if (leftwing && rightwing) {
				leftwing.rotation.y = -0.2 - wingRotation;
				rightwing.rotation.y = -0.2 - wingRotation;
			}
		}

		flightTime += delta;
		switch (state) {
			case 'LeavingPerch':
				animateLeavingPerch();
				break;
			case 'HoldPattern':
				animateHoldPattern();
				break;
			case 'FlyingToPerch':
				animateFlyingToPerch();
				break;
		}
	});

	function animateLeavingPerch() {
		const duration = 0.4;
		const t = flightTime / duration;
		if (t > 1) {
			switchState('HoldPattern');
			return;
		}
		const x = easeOutQuad(t);
		const newPosition = flightPath.getPointAt(x);
		ref?.position.copy(newPosition);
	}

	function animateHoldPattern() {
		const duration = 2;
		const t = flightTime / duration;
		if (t > 1) {
			switchState('FlyingToPerch');
		} else {
			const newPosition = flightPath.getPointAt(t);
			ref?.position.copy(newPosition);
		}
	}

	function animateFlyingToPerch() {
		const duration = 3;
		const t = flightTime / duration;
		if (t > 1) {
			switchState('Perched');
		} else {
			const x = easeInOutSine(t);
			const newPosition = flightPath.getPointAt(x);
			ref?.position.copy(newPosition);
		}
	}
</script>

{#if $gltf}
	<T.Group bind:ref scale={0.7} rotation={[-Math.PI / 12, Math.PI, 0]} {position}>
		<T.Mesh
			geometry={$gltf.nodes.Plane018.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[-1.72, -0.42, 0.01]}
			bind:ref={leftwing}
		>
			<T.MeshStandardMaterial color={0xed8d34} flatShading={true} />
		</T.Mesh>
		<T.Mesh
			geometry={$gltf.nodes.Cylinder001.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[-1.72, -0.01, 0]}
			scale={1.1}
		>
			<T.MeshStandardMaterial color={'black'} flatShading={true} />
		</T.Mesh>
		<T.Mesh
			geometry={$gltf.nodes.Sphere002.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[-1.72, -0.01, 0]}
			scale={1.1}
		>
			<T.MeshStandardMaterial color={'black'} flatShading={true} />
		</T.Mesh>
		<T.Mesh
			geometry={$gltf.nodes.NurbsPath_1.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[-1.72, -0.01, 0]}
			scale={1.1}
		>
			<T.MeshStandardMaterial color={'black'} flatShading={true} />
		</T.Mesh>
		<T.Mesh
			geometry={$gltf.nodes.Plane021.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[1.42, -0.42, 0]}
			scale={-1.1}
			bind:ref={rightwing}
		>
			<T.MeshStandardMaterial color={0xed8d34} flatShading={true} />
		</T.Mesh>
		<T.Mesh
			geometry={$gltf.nodes.Cylinder020_1.geometry}
			position={[0, -0.01, -0.17]}
			rotation={[-1.72, -0.01, 0]}
			scale={1.1}
		>
			<T.MeshStandardMaterial color={'black'} flatShading={true} />
		</T.Mesh>
	</T.Group>
{/if}
