<script lang="ts">
	import { Suspense, interactivity } from '@threlte/extras';
	import Word from '$lib/components/word.svelte';

	interactivity();

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
			['e', 1.2, fuschia],
			['b', 2, green]
		]}
		position={[0, 1.5]}
	/>
	<Word
		text={[
			['f', 0, fuschia],
			['o', 0.4, green],
			['r', 1.2, yellow]
		]}
		position={[-2, 0.5]}
		delay={200}
	/>
	<Word
		text={[
			['H', 0, turquoise],
			['u', 0.9, green],
			['m', 1.6, fuschia],
			['a', 2.7, blue],
			['n', 3.5, yellow],
			['s', 4.2, orange]
		]}
		position={[0, 0.5]}
		delay={400}
	/>
</Suspense>
