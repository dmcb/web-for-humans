<script lang="ts">
	import { useTask, useThrelte } from '@threlte/core';
	import * as THREE from 'three';

	const { scene, camera, renderer, renderStage } = useThrelte();

	useTask(
		(delta) => {
			const orthographicCamera = camera.current as THREE.OrthographicCamera;

			const camWidth = 600;
			const camHeight = 400;

			orthographicCamera.left = -camWidth;
			orthographicCamera.right = camWidth;
			orthographicCamera.top = camHeight;
			orthographicCamera.bottom = -camHeight;
			orthographicCamera.updateProjectionMatrix();

			renderer.setSize(1200, 800);
			renderer.toneMapping = THREE.NoToneMapping;
			renderer.render(scene, orthographicCamera);
		},
		{ stage: renderStage }
	);
</script>
