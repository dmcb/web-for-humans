<script lang="ts">
	import { T } from '@threlte/core';
	import { Text3DGeometry } from '@threlte/extras';
	import fragmentShader from '$lib/shaders/fragment.glsl?raw';
	import vertexShader from '$lib/shaders/vertex.glsl?raw';

	interface Props {
		letter?: string;
		offset?: number;
		color?: [number, number, number];
		font: any;
	}

	let {
		letter = 'A',
		offset = 0,
		color = [0, 1, 0],
		font
	}: Props = $props();
</script>

<T.Mesh position={[offset, 0, 0]}>
	<Text3DGeometry text={letter} size={1} depth={500} {font} />
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
