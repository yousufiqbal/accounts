<script>
  import { kebabCase, startCase } from "lodash-es";

  // 2 Props
  export let items = [], group = []
</script>

<div class="checkbox-group {$$props.class}">

  {#each items as item}
  {@const att = kebabCase(item)}

  <div tabindex="0" class="checkbox">
    <input type="checkbox" value={att} name={att} id={att} bind:group >
    <label for="{att}">{startCase(item)}</label>
  </div>

  {/each}
  
</div>

<style>
  .checkbox-group {
    display: grid;
    row-gap: 10px;
  }
  input {
    position: absolute;
    left: -9999px;
    display: none
  }

  input + label {
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    line-height: 20px;
    display: inline-block;
    color: #666;
  }

  input + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    background: #fff;
  }

  input + label:after {
    content: '';
    width: 8px;
    height: 8px;
    background: #154bff;
    position: absolute;
    top: 6px;
    left: 6px;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
  }

  input:not(:checked) + label:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
  }

  input:checked + label:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
  }
</style>