<script lang="ts">
	import Scene from '$lib/scene.svelte';
</script>

<svelte:head>
	<title>Web for Humans</title>
	<meta
		name="description"
		content="Website strategy, design, development and launch consulting, for humans."
	/>
	<meta property="og:type" content="website" />
	<meta property="og:image" content="https://webforhumans.solutions/webforhumans.png" />
	<meta property="og:image:width" content="1200" />
	<meta property="og:image:height" content="630" />
</svelte:head>

<main>
	<Scene />
	<h1>Web For Humans</h1>
	<section class="introduction">
		<h2>Your partner for making great things on the web.</h2>
		<p>Website strategy, design, development and launch consulting, for humans.</p>
		<a href="https://calendly.com/webforhumans/consultation">Book a consultation</a>
	</section>
</main>

<style lang="scss">
	:global(html) {
		font-size: max(1rem, 1.33vw);
		font-family: 'IBM Plex Sans', sans-serif;
		font-weight: 400;
		font-style: normal;
		background-color: #767665;
		color: #fff;
	}

	:global(body) {
		margin: 0;
		padding: 0;
	}

	section.introduction {
		margin-top: calc(min(70vw, 560px));
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
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
		border: 0;
		clip: rect(0 0 0 0);
		height: 1px;
		margin: -1px;
		overflow: hidden;
		padding: 0;
		position: absolute;
		width: 1px;
	}

	h2 {
		font-family: 'Platypi', serif;
		font-optical-sizing: auto;
		font-weight: 300;
		font-size: 1.2rem;
		line-height: 1;
		margin-top: 0;

		@media (min-width: 320px) {
			font-size: 1.5rem;
		}
	}

	p {
		margin-top: 0;
	}

	em {
		position: absolute;
		transform: translate(-120%, 0);
		font-size: 0.6em;
	}

	a {
		margin-top: 1rem;
		text-align: center;
		text-decoration: none;
		color: #000;
		font-family: 'IBM Plex Sans', sans-serif;
		background-color: #51b4ef;
		padding: 0.5rem 0.75rem;
		border-radius: 0.5rem;
		transition:
			transform 0.2s,
			outline-offset 0.2s;
		outline: 0.2rem solid #51b4ef;
		outline-offset: -0.2rem;
		outline-style: dashed;

		&:hover {
			transform: scale(1.05);
		}

		&:focus {
			outline-offset: 0.2rem;
		}
	}
</style>
