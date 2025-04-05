<script lang="ts">
	import { T } from '@threlte/core';
	import { onReveal } from '@threlte/extras';
	import { spring, tweened } from 'svelte/motion';
	import { cubicOut } from 'svelte/easing';
	import Letter from './letter.svelte';

	interface Props {
		text: [string, number, [number, number, number]][];
		position: [number, number];
		perch: number;
		shakePerch: (perch: number) => void;
		font: any;
		delay?: number;
	}

	let { text, position, perch, shakePerch, font, delay = 0 }: Props = $props();

	onReveal(() => {
		depth.set(-500);
	});

	const raise = spring(0, {
		stiffness: 0.05,
		damping: 0.2
	});

	const depth = tweened(-550, {
		delay: delay,
		duration: 600,
		easing: cubicOut
	});

	function startShake(e: Event) {
		e.stopPropagation();
		raise.set(1);
		shakePerch(perch);
	}

	function stopShake(e: Event) {
		e.stopPropagation();
		raise.set(0);
		shakePerch(-1);
	}
</script>

<T.Group
	position={[position[0], position[1], $depth + $raise]}
	onpointerover={startShake}
	onpointerout={stopShake}
	ontouchstart={startShake}
	ontouchend={stopShake}
>
	{#each text as [letter, offset, color], i}
		<Letter {letter} {offset} {color} {font} />
	{/each}
</T.Group>
