<script lang="ts">
	import { Suspense, interactivity } from '@threlte/extras';
	import Word from '$lib/components/word.svelte';

	interactivity();
</script>

<Suspense>
	<Word text={'Web'} position={[0, 1.5]} color={[0, 1, 0]} />
	<Word text={'for'} position={[-2, 0.5]} color={[0, 0, 1]} delay={200} />
	<Word text={'Humans'} position={[0, 0.5]} color={[1, 0, 0]} delay={400} />
</Suspense>
