<script lang="ts">
	import { useLoader } from '@threlte/core';
	import { Suspense, interactivity } from '@threlte/extras';
	import { FontLoader } from 'three/examples/jsm/loaders/FontLoader.js';
	import Word from '$lib/components/word.svelte';
	import Butterfly from '$lib/components/butterfly.svelte';

	interactivity();

	let font = useLoader(FontLoader).load('/fonts/Barlow_Condensed_Bold.json');
	let accentFont = useLoader(FontLoader).load('/fonts/Crimson_Text_SemiBold_Italic.json');

	let red: [number, number, number] = [0.99, 0.119, 0.09];
	let orange: [number, number, number] = [0.985, 0.411, 0];
	let yellow: [number, number, number] = [0.987, 0.72, 0];
	let green: [number, number, number] = [0.583, 0.704, 0];
	let turquoise: [number, number, number] = [0, 0.67, 0.6];
	let blue: [number, number, number] = [0, 0.647, 0.951];
	let fuschia: [number, number, number] = [0.94, 0, 0.34];
</script>

<Suspense>
	<Butterfly position={[0.1, 2.51, -0.2]} />
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
			['r', 0.95, yellow]
		]}
		position={[-1.5, 0.5]}
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
		{font}
		delay={800}
	/>
</Suspense>
