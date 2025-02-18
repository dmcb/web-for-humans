<script lang="ts">
	import { useLoader } from '@threlte/core';
	import { Suspense, interactivity } from '@threlte/extras';
	import { FontLoader } from 'three/examples/jsm/loaders/FontLoader.js';
	import Word from '$lib/components/word.svelte';
	import Butterfly from '$lib/components/butterfly.svelte';

	interactivity();

	const font = useLoader(FontLoader).load('/fonts/Barlow_Condensed_Bold.json');
	const accentFont = useLoader(FontLoader).load('/fonts/Crimson_Text_SemiBold_Italic.json');

	const red: [number, number, number] = [0.99, 0.119, 0.09];
	// const orange: [number, number, number] = [0.985, 0.411, 0];
	const yellow: [number, number, number] = [0.987, 0.72, 0];
	const green: [number, number, number] = [0.583, 0.704, 0];
	const turquoise: [number, number, number] = [0, 0.67, 0.6];
	const blue: [number, number, number] = [0, 0.647, 0.951];
	const fuschia: [number, number, number] = [0.94, 0, 0.34];

	const perchPoints: [number, number, number][] = [
		[0.1, 2.51, -0.2],
		[-1, 1.45, -0.2],
		[3.88, 1.55, -0.2]
	];

	let shookPerch = $state(-1);

	function shakePerch(perch: number) {
		console.log('Shaking perch', perch);
		shookPerch = perch;
	}
</script>

<Suspense>
	<Butterfly {perchPoints} {shookPerch} />
	<Word
		text={[
			['W', 0, blue],
			['E', 0.95, fuschia],
			['B', 1.55, green]
		]}
		position={[0, 1.5]}
		perch={0}
		{shakePerch}
		{font}
	/>
	<Word
		text={[
			['f', 0, fuschia],
			['o', 0.4, green],
			['r', 0.95, yellow]
		]}
		position={[-1.5, 0.5]}
		perch={1}
		{shakePerch}
		font={accentFont}
		delay={250}
	/>
	<Word
		text={[
			['H', 0, turquoise],
			['U', 0.65, green],
			['M', 1.3, fuschia],
			['A', 2.05, yellow],
			['N', 2.7, blue],
			['S', 3.4, red]
		]}
		position={[0.157, 0.5]}
		perch={2}
		{shakePerch}
		{font}
		delay={800}
	/>
</Suspense>
