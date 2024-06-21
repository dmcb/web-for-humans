<script lang="ts">
	import { Canvas, T } from '@threlte/core';
	import { Text3DGeometry, Suspense } from '@threlte/extras';
</script>

<Canvas size={{ width: 1200, height: 1200 }}>
	<T.OrthographicCamera
		makeDefault
		near={-2000}
		far={2000}
		zoom={120}
		position={[-20, 10, 100]}
		on:create={({ ref }) => {
			ref.lookAt(0, 0, 0);
		}}
	/>
	<Suspense>
		<T.AmbientLight intensity={0.2} />
		<T.DirectionalLight intensity={0.5} position={[5, 200, 500]} />
		<T.Mesh position={[0, 1.5, -500]}>
			<Text3DGeometry text={'Web'} size={1} depth={500} />
			<T.MeshStandardMaterial />
		</T.Mesh>
		<T.Mesh position={[-2, 0.5, -500]}>
			<Text3DGeometry text={'for'} size={1} depth={500} />
			<T.MeshStandardMaterial />
		</T.Mesh>
		<T.Mesh position={[0, 0.5, -500]}>
			<Text3DGeometry text={'Humans'} size={1} depth={500} />
			<T.MeshStandardMaterial />
		</T.Mesh>
	</Suspense>
</Canvas>

<style lang="scss">
	:global(canvas) {
		z-index: -1;
		position: absolute;
		object-fit: cover;
		top: 0;
		left: 0;
		width: 50vw !important;
		height: 50vw !important;
		background-color: beige;
	}
</style>
