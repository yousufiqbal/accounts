<script>
  import { page } from "$app/stores";
  import { startCase } from "lodash-es";

  export let baseUrl = '/steps'
  export let steps = ['register', 'verification', 'license-agreement']

  $: currentStep = $page.url.searchParams.get('step') || steps[0]
  $: currentIndex = steps.indexOf(currentStep)

  $: previousStep = steps[steps.indexOf(currentStep) - 1]
</script>

<div class="steps {$$props.class}">

  {#each steps as step, index}
  <div class="step">
    
    <div class="serial">{index + 1}</div>
    
    <a href="{baseUrl}?step={step}" class="title-status">
      <div class:active={currentIndex == index} class="title">{startCase(step)}</div>
      <div class="status">{currentIndex == index ? 'Active' : currentIndex < index ? 'Pending' : 'Completed' }</div>
    </a>
  
  </div>
  {/each}

</div>

<style>
  .title.active {
    color: rgb(0, 180, 75) !important;
  }
  .steps {
    margin-bottom: 20px;
    /* margin: 0 auto; */
    max-width: 800px;
    display: flex;
    border: var(--border);
    border-left: none;
    /* outline: 1px solid red; */
  }
  .step {
    flex: 1;
    display: flex;
    /* outline: 1px solid blue; */
  }
  .serial {
    background-color: rgb(241, 241, 241);
    padding: var(--padding);
    /* border-right: var(--border); */
    border-left: var(--border);
  }
  .title-status {
    flex: 1;
    display: grid;
    /* outline: 1px solid red; */
  }
  .title {
    color: rgb(95, 95, 255);
    font-weight: bold;
    font-size: 1.3rem;
    /* border-bottom: var(--border); */
    padding: var(--padding);
    padding-bottom: 0;
  }
  .status {
    padding: var(--padding);
    padding-top: 0;
  }
</style>