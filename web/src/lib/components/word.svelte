<script lang="ts">
	import { T } from '@threlte/core';
	import { onReveal } from '@threlte/extras';
	import { spring, tweened } from 'svelte/motion';
	import { cubicOut } from 'svelte/easing';
	import Letter from '$lib/components/letter.svelte';

	interface Props {
		text: [string, number, [number, number, number]][];
		position?: [number, number];
		font: any;
		delay?: number;
	}

	let { text, position = [0, 0], font, delay = 0 }: Props = $props();

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
	onpointerover={(e: Event) => {
		e.stopPropagation();
		raise.set(1);
	}}
	onpointerout={(e: Event) => {
		e.stopPropagation();
		raise.set(0);
	}}
>
	{#each text as [letter, offset, color], i}
		<Letter {letter} {offset} {color} {font} />
	{/each}
</T.Group>
