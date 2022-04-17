<script>
  import { startCase } from "lodash-es";

  export let platforms = ['facebook', 'twitter', 'whatsapp', 'linkedin', 'instagram']
  export let side = 'start'
</script>

<div class="share-buttons {side} {$$props.class}">

  <span>Share on: </span>

  <div class="buttons">
    {#each platforms as platform}
    <a title="{startCase(platform)}" class="{platform}" href="/">
      <i class="ri-{platform}-fill ri-2x"></i>
    </a>
    {/each}
  </div>
  
</div>

<style>
  .start { justify-content: start; }
  .end { justify-content: end; }
  .center { justify-content: center; }
  .share-buttons {
    margin: 30px 0;
    display: flex;
    align-items: center;
    column-gap: 15px;
  }
  span {
    font-size: 1.2rem;
  }
  .buttons {
    background-color: #fff;
    display: flex;
    column-gap: 15px;
  }
  a {
    display: flex;
    color: rgb(70, 70, 70);
    transition: all 300ms;
    background-color: rgb(238, 238, 238);
    border-radius: 4px;
    padding: 7px;
  }
  a:hover {
    color: white;
  }
  a.facebook:hover { background-color: #1877F2; }
  a.twitter:hover { background-color: #1D9BF0; }
  a.linkedin:hover { background-color: #0A66C2; }
  a.whatsapp:hover { background-color: #1F8D7D; }
  a.instagram:hover { background-color: #BE0091; }
</style>