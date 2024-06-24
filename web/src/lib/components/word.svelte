<script lang="ts">
	import { T } from '@threlte/core';
	import { Text3DGeometry, onReveal } from '@threlte/extras';
	import fragmentShader from '$lib/shaders/fragment.glsl?raw';
	import vertexShader from '$lib/shaders/vertex.glsl?raw';
	import { spring, tweened } from 'svelte/motion';
	import { cubicOut } from 'svelte/easing';

	export let delay: number = 0;
	export let text: string = '';
	export let position: [number, number] = [0, 0];
	export let color: [number, number, number] = [0, 1, 0];

	const raise = spring(0, {
		stiffness: 0.09,
		damping: 0.2
	});
	const depth = tweened(-550, {
		delay: delay,
		duration: 600,
		easing: cubicOut
	});

	onReveal(() => {
		depth.set(-500);
	});
</script>

<T.Group
	position={[position[0], position[1], $depth + $raise]}
	on:pointerover={(e) => {
		e.stopPropagation();
		raise.set(0.7);
	}}
	on:pointerout={(e) => {
		e.stopPropagation();
		raise.set(0);
	}}
>
	<T.Mesh>
		<Text3DGeometry {text} size={1} depth={500} />
		<T.ShaderMaterial
			{fragmentShader}
			{vertexShader}
			uniforms={{
				color: {
					value: color
				}
			}}
		/>
	</T.Mesh>
</T.Group>
