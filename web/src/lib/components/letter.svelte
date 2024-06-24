<script lang="ts">
	import { T } from '@threlte/core';
	import { Text3DGeometry } from '@threlte/extras';
	import fragmentShader from '$lib/shaders/fragment.glsl?raw';
	import vertexShader from '$lib/shaders/vertex.glsl?raw';

	export let letter: string = 'A';
	export let offset: number = 0;
	export let color: [number, number, number] = [0, 1, 0];
</script>

<T.Mesh position={[offset, 0, 0]}>
	<Text3DGeometry text={letter} size={1} depth={500} />
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
