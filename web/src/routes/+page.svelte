<script lang="ts">
	import Scene from '$lib/scene.svelte';
</script>

<main>
	<Scene />
	<!-- <h1>
		<span>Web</span>
		<span><em>for</em> Humans</span>
	</h1>
	<p>Coming soon.</p> -->
</main>

<style lang="scss">
	:global(html) {
		font-size: clamp(1rem, 2vw, 1.5rem);
		font-family: 'IBM Plex Sans', sans-serif;
		font-weight: 400;
		font-style: normal;
	}

	:global(body) {
		margin: 0;
		padding: 0;
	}

	main {
		margin-left: 5em;
		margin-right: 5em;
	}

	h1 {
		font-family: 'Platypi', serif;
		font-optical-sizing: auto;
		font-weight: 300;
		font-size: 3em;
		line-height: 1;
	}

	span {
		display: flex;
		align-items: end;
	}

	em {
		position: absolute;
		transform: translate(-120%, 0);
		font-size: 0.6em;
	}
</style>
