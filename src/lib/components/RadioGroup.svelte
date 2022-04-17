<script>
  import { kebabCase, startCase } from "lodash-es";

  export let items = [], name, group = ''
  export let error = null
  export let title
</script>

{#if items.length != 0}
<div class="radio-group {$$props.class}">
  
  <div class="items">

    {#if title}
    <div class="title">{title}</div>
    {/if}

    {#each items as item}
    {@const att = kebabCase(item)}
    
    <div class="radio">
      <input type="radio" value={att} {name} id={att} bind:group >
      <label for="{att}">{startCase(item)}</label>
    </div>
    {/each}
  </div>
  
  {#if error}
  <span class="error">{error}</span>
  {/if}
  
</div>
{/if}

<style>
  .title {
    font-weight: bold;
  }
  /* From: https://codepen.io/manabox/pen/raQmpL */
  
  .radio-group {
    display: grid;
  }
  .items {
    display: flex;
    column-gap: 15px;
  }

  .error {
    color: red;
    padding: 7px 0;
  }

  input {
    display: none;
  }

  input + label {
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    line-height: 20px;
    display: flex;
    color: black;
  }

  input + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    border: 1px solid rgb(122, 122, 122);
    border-radius: 100%;
    background: #fff;
  }

  input+label:after {
    content: '';
    width: 10px;
    height: 10px;
    background: rgb(69, 69, 255);
    position: absolute;
    top: 5px;
    left: 5px;
    border-radius: 100%;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
  }

  input:not(:checked)+label:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
  }

  input:checked+label:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
  }
</style>