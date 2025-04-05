<script lang="ts">
	import { Canvas, T } from '@threlte/core';
	import Logo from '$lib/components/logo.svelte';
	import CustomRenderer from './customrenderer.svelte';
</script>

<Canvas autoRender={false}>
	<T.AmbientLight intensity={1} />
	<T.DirectionalLight intensity={4} position={[-2, 0, 0]} />
	<T.OrthographicCamera
		makeDefault
		near={-2000}
		far={2000}
		zoom={120}
		position={[-30, -17, 100]}
		oncreate={(ref) => {
			ref.lookAt(1.1, -0.4, 0);
		}}
	/>
	<Logo />
	<CustomRenderer />
</Canvas>

<style lang="scss">
	:global(div) {
		position: absolute !important;
		z-index: -1;
		top: 0;
	}
	:global(canvas) {
		object-fit: cover;
		top: 0;
		left: 0;
		width: 100vw !important;
		height: 100vw !important;
		max-width: 1200px;
		max-height: 800px;

		@media (min-width: 1200px) {
			width: 100vw !important;
			height: 66.66vw !important;
			max-width: none;
			max-height: none;
		}
	}
</style>
