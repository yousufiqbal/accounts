<script>
  export let text
</script>

<div class="subtitle {$$props.class}">
  <h2>{text}</h2>
  <div class="border"></div>
</div>

<style>
  .subtitle {
    /* outline: 1px solid red; */
    background-color: #fff;
    display: flex;
    /* justify-content: center; */
    position: sticky;
    top: 0;
    padding: 7px 7px 7px 0;
  }
  h2 {
    color: black;
    /* text-align: center; */
    font-family: 'Bree Serif';
    z-index: 2;
    /* border: var(--border); */
    background-color: #fff;
    font-size: 1.2rem;
    padding: 0 10px 0 0;
  }
  .border {
    position: absolute;
    width: 100%;
    top: 19px;
    border-bottom: 2px solid black;
    border-image: linear-gradient(to right, green, green, gray, rgb(187, 187, 187), white) 1;
  }
</style>