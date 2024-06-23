<script lang="ts">
	import { T } from '@threlte/core';
	import { Text3DGeometry, onReveal } from '@threlte/extras';
	import fragmentShader from '$lib/shaders/fragment.glsl?raw';
	import vertexShader from '$lib/shaders/vertex.glsl?raw';
	import { spring } from 'svelte/motion';

	export let text: string = '';
	export let position: [number, number, number] = [0, 0, 0];
	export let color: [number, number, number] = [0, 1, 0];

	const depth = spring(0);

	onReveal(() => {
		console.log('The component has been revealed');
	});
</script>

<T.Group
	position={[0, 0, $depth]}
	on:pointerover={(e) => {
		e.stopPropagation();
		depth.set(1);
	}}
	on:pointerout={(e) => {
		e.stopPropagation();
		depth.set(0);
	}}
>
	<T.Mesh {position}>
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
<!-- </Suspense> -->
