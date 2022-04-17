<script>
  // import Icon from "./Icon.svelte"
  
  export let description = false
  export let steps = [
    { title: 'Profile Info', description: 'The quick brown fox' },
    { title: 'Billing Address', description: 'The quick brown fox' },
    { title: 'Confirm Order', description: 'The quick brown fox' },
  ]

  export let currentStep = 1

  // For parent component use..
  export const gotoNextStep = () => {
    if (currentStep > steps.length) return
    +currentStep++
  }

  const changeStep = value => {
    if (value > +currentStep + 1) {
      alert('Complete previous step first'); return
    }
    currentStep = +value
  }
</script>
  
{#if steps.length != 0}
<div class="steps">

  <div class="navigation">

    {#each steps as step, index}
    <button class="step" on:click|stopPropagation={()=>changeStep(index+1)} >

      <div class="serial">{index+1}.</div>

      <div class:completed={currentStep > index + 1} class:active={+currentStep == index + 1} class="title-description">
        <div class="title">{step.title}</div>
        {#if description}
        <div class="description">{step.description}</div>
        {/if}
        <div class="status">
          <div> {(currentStep > index + 1) ? 'Completed' : (currentStep == index + 1) ? 'Active' : 'Pending'} </div>
          {#if currentStep > index + 1}
          <span>I</span>
          <!-- <Icon height="20" name='checkCircle' stroke="green" /> -->
          {/if}
        </div>
      </div>

    </button>
    {/each}

  </div>

</div><!-- End of steps tag -->
{/if}

<style>
  .steps {
    /* border: 1px solid red; */
    margin-bottom: 20px;
  }
  .navigation {
    display: flex;
    border-left: 1px solid gray;
  }
  .step {
    border: 1px solid gray;
    border-left: none;
    display: flex;
    align-items: stretch;
  }
  .serial {
    font-weight: bold;
    /* color: red; */
    padding: 8px 15px;
    border-right: 1px solid gray;
    /* background-color: rgb(243, 243, 243); */
  }
  .title-description {
    padding: 8px 15px;
    padding-right: 30px;
  }
  .title {
    font-weight: bold;
    font-size: 1.3rem;
    margin-bottom: 4px;
  }
  .active {
    background-color: rgb(255, 250, 223);
    color: white;
  }
  .completed {
    background-color: rgb(223, 255, 215);
  }
  button:hover .title {
    color: red;
  }
  .status {
    /* border: 1px solid red; */
    display: grid;
    grid-auto-flow: column;
    align-items: center;
    justify-content: start;
    column-gap: 5px;
    padding: 0 !important;
  }
</style>