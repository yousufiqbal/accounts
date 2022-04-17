<script>
  import Avatar from "$lib/components/Avatar.svelte";
import Logo from "$lib/components/Logo.svelte";
import RemixIcon from "$lib/components/RemixIcon.svelte";
</script>

<div class="navbar {$$props.class}">
  <Logo />
  <div class="links">
    <a class="home" href="/">Home</a><span class="home">/</span>
    <a href="/brands">Brands</a><span>/</span>
    <a href="/blogs">Blogs</a><span>/</span>
    <a href="/compare">Compare</a>
  </div>
  <div class="user">
    <Avatar name="Yosof" />
  </div>
</div>

<style>
  .user, .home {
    display: none;
  }
  .navbar {
    /* outline: 1px solid red; */
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .links {
    display: flex;
    column-gap: 12px;
    text-align: center;
    /* padding: 3px 7px; */
    /* border-left: var(--border); */
  }
  .links a {
    font-family: 'Bree Serif';
    color: green;
    /* border-right: 1px solid black; */
    border-bottom: 1px solid white;
  }
  .links a:hover {
    color: blue;
    border-bottom: 1px solid black;
  }
  @media (min-width: 1000px) {
    .navbar {
      margin-bottom: 30px;
    }
    .links {
      column-gap: 30px;
    }
    .links * {
      font-size: 1.3rem;
    }
    .user {
      display: initial;
    }
    .home {
      display: initial;
    }
  }
</style>