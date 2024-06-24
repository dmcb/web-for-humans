<script lang="ts">
	import { useLoader } from '@threlte/core';
	import { Suspense, interactivity } from '@threlte/extras';
	import Word from '$lib/components/word.svelte';
	import { FontLoader } from 'three/examples/jsm/loaders/FontLoader.js';

	interactivity();

	let font = useLoader(FontLoader).load('/fonts/Barlow_Condensed_Bold.json');
	let accentFont = useLoader(FontLoader).load('/fonts/Crimson_Text_SemiBold_Italic.json');

	let red: [number, number, number] = [0.8, 0.149, 0.09];
	let orange: [number, number, number] = [0.925, 0.411, 0.157];
	let yellow: [number, number, number] = [0.937, 0.8, 0.416];
	let green: [number, number, number] = [0.733, 0.764, 0.234];
	let turquoise: [number, number, number] = [0.262, 0.67, 0.6];
	let blue: [number, number, number] = [0.266, 0.647, 0.901];
	let fuschia: [number, number, number] = [0.78, 0.02, 0.34];
</script>

<Suspense>
	<Word
		text={[
			['W', 0, blue],
			['E', 0.95, fuschia],
			['B', 1.55, green]
		]}
		position={[0, 1.5]}
		{font}
	/>
	<Word
		text={[
			['f', 0, fuschia],
			['o', 0.4, green],
			['r', 0.9, yellow]
		]}
		position={[-1.7, 0.5]}
		font={accentFont}
		delay={200}
	/>
	<Word
		text={[
			['H', 0, turquoise],
			['U', 0.65, green],
			['M', 1.3, fuschia],
			['A', 2.05, blue],
			['N', 2.7, yellow],
			['S', 3.4, orange]
		]}
		position={[0, 0.5]}
		{font}
		delay={700}
	/>
</Suspense>
