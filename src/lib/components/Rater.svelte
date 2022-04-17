<script>
  import { onMount } from 'svelte'
  
  const comments = ['Bad!', 'Average', 'Ok', 'Good', 'Excellent!']
  export let rating = null, comment = null
  let starsGroup, stars
  
  onMount(() => {
    stars = starsGroup.querySelectorAll('i')
    if (rating) fill(rating)
  })

  const fill = id => {
    comment = comments[id - 1]
    for (let [index, star] of stars.entries()) {
      if (index <= (id - 1)) {
        star.classList.add('fill')
      }
    }
  }

  const unfill = () => {
    comment = null
    for (let star of stars) {
      star.classList.remove('fill')
    }
  }

  const rate = e => {
    rating = +e.target.id
    fill(rating)
  }

  const mouseEnter = e => {
    unfill()
    fill(e.target.id)
  }

  const mouseLeave = () => {
    unfill()
    if (rating) fill(rating)
  }
</script>

<div class="rater {$$props.class}">
  <div bind:this={starsGroup} class="stars-group">
    <i on:mouseleave={mouseLeave} on:click={rate} on:mouseenter="{mouseEnter}" id="1" class="ri-star-fill ri-lg"></i>
    <i on:mouseleave={mouseLeave} on:click={rate} on:mouseenter="{mouseEnter}" id="2" class="ri-star-fill ri-lg"></i>
    <i on:mouseleave={mouseLeave} on:click={rate} on:mouseenter="{mouseEnter}" id="3" class="ri-star-fill ri-lg"></i>
    <i on:mouseleave={mouseLeave} on:click={rate} on:mouseenter="{mouseEnter}" id="4" class="ri-star-fill ri-lg"></i>
    <i on:mouseleave={mouseLeave} on:click={rate} on:mouseenter="{mouseEnter}" id="5" class="ri-star-fill ri-lg"></i>
  </div>
  <div class="comment">{comment || ''}</div>
</div>

<style>
  .rater {
    /* outline: 1px solid red; */
    display: grid;
    column-gap: 10px;
  }
  .stars-group {
    display: inline-flex;
    align-items: center;
  }
  i {
    color: rgb(209, 209, 209);
    cursor: pointer;
    padding: 2px;
  }
  i:hover {
    color: rgb(255, 166, 0);
  }
  :global(.fill) {
    color: rgb(255, 166, 0) !important;
  }
  .comment {
    padding: 4px;
    line-height: 1.2;
  }
</style>