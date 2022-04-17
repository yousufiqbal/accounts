<script>
  export let text
</script>

<div class="subtitle {$$props.class}">
  <h2>{text}</h2>
  <div class="border"></div>
</div>

<style>
  .subtitle {
    display: flex;
    justify-content: center;
    position: relative;
  }
  h2 {
    color: black;
    text-align: center;
    font-family: 'Bree Serif';
    z-index: 2;
    /* border: var(--border); */
    background-color: #fff;
    font-size: 1.2rem;
    padding: 0 10px;
  }
  .border {
    position: absolute;
    width: 100%;
    top: 14px;
    border-bottom: var(--border);
    border-image: linear-gradient(to right, white, red, green, red, white) 1;
  }
</style>