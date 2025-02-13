<script lang="ts">
	import { Canvas, T } from '@threlte/core';
	import Logo from '$lib/components/logo.svelte';
	import CustomRenderer from './customrenderer.svelte';
</script>

<Canvas autoRender={false}>
	<!-- <T.AmbientLight intensity={1} /> -->
	<!-- <T.DirectionalLight intensity={0.5} position={[5, 200, 500]} /> -->
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
		position: static !important;
	}
	:global(canvas) {
		z-index: -1;
		position: absolute !important;
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
