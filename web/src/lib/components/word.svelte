<script lang="ts">
	import { T } from '@threlte/core';
	import { onReveal } from '@threlte/extras';
	import { spring, tweened } from 'svelte/motion';
	import { cubicOut } from 'svelte/easing';
	import Letter from '$lib/components/letter.svelte';

	export let text: [string, number, [number, number, number]][];
	export let position: [number, number] = [0, 0];
	export let font: any;
	export let delay: number = 0;

	const raise = spring(0, {
		stiffness: 0.05,
		damping: 0.2
	});
	const depth = tweened(-550, {
		delay: delay,
		duration: 600,
		easing: cubicOut
	});

	onReveal(() => {
		depth.set(-500);
	});
</script>

<T.Group
	position={[position[0], position[1], $depth + $raise]}
	on:pointerover={(e) => {
		e.stopPropagation();
		raise.set(1);
	}}
	on:pointerout={(e) => {
		e.stopPropagation();
		raise.set(0);
	}}
>
	{#each text as [letter, offset, color], i}
		<Letter {letter} {offset} {color} {font} />
	{/each}
</T.Group>
