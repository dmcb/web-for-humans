<script lang="ts">
	import Scene from '$lib/scene.svelte';
</script>

<svelte:head>
	<title>Web for Humans</title>
</svelte:head>

<main>
	<Scene />
	<section class="introduction">
		<h1>Your partner for making great things on the web.</h1>
		<p>Coming soon.</p>
	</section>
</main>

<style lang="scss">
	:global(html) {
		font-size: max(1rem, 1.33vw);
		font-family: 'IBM Plex Sans', sans-serif;
		font-weight: 400;
		font-style: normal;
		background-color: #959583;
		color: #fff;
	}

	:global(body) {
		margin: 0;
		padding: 0;
	}

	section.introduction {
		margin-top: calc(min(70vw, 560px));
		margin-left: auto;
		margin-right: auto;
		padding-left: 1rem;
		padding-right: 1rem;
		max-width: 18rem;

		@media (min-width: 1200px) {
			margin-top: 46vw;
		}
	}

	h1 {
		font-family: 'Platypi', serif;
		font-optical-sizing: auto;
		font-weight: 300;
		font-size: 1.2rem;
		line-height: 1;

		@media (min-width: 320px) {
			font-size: 1.5rem;
		}
	}

	em {
		position: absolute;
		transform: translate(-120%, 0);
		font-size: 0.6em;
	}
</style>
