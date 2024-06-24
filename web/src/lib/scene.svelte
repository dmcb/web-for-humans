<script lang="ts">
	import { Canvas, T } from '@threlte/core';
	import Logo from '$lib/components/logo.svelte';
</script>

<Canvas size={{ width: 1200, height: 800 }}>
	<!-- <T.AmbientLight intensity={1} /> -->
	<!-- <T.DirectionalLight intensity={0.5} position={[5, 200, 500]} /> -->
	<T.OrthographicCamera
		makeDefault
		near={-2000}
		far={2000}
		zoom={120}
		position={[-30, -17, 100]}
		on:create={({ ref }) => {
			ref.lookAt(0.9, 0, 0);
		}}
	/>
	<Logo />
</Canvas>

<style lang="scss">
	:global(canvas) {
		z-index: -1;
		position: absolute;
		object-fit: cover;
		top: 0;
		left: 0;
		width: min(100vw, 100vh) !important;
		height: min(100vw, 100vh) !important;
	}
</style>
