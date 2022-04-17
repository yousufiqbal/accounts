<table class="table {$$props.class}">
  <slot></slot>
</table>

<style global>
  .table .spacer {
    margin: 20px 0;
  }
  .table {
    /* outline: 1px solid red; */
    width: 100%;
    /* max-width: 1000px; */
    border-collapse: collapse;
    /* margin-bottom: 20px; */
    white-space: nowrap;
  }
  /* .table th { */
    /* width: 120px; */
  /* } */
  .table .title {
    color: green;
    /* display: block; */
    /* width: 100%; */
    padding: var(--padding) !important;
    border: var(--border);
    border-bottom: none;
  }
  .table tr:hover {
    background-color: rgb(246, 246, 255);
  }
  .table caption {
    padding: var(--padding);
    border: var(--border);
    border-bottom: none;
    background-color: rgb(243, 243, 243);
  }
  .table td, .table th {
    padding: var(--padding);
    border: var(--border);
    /* text-transform: capitalize; */
  }
  .table .main {
    width: 100%;
  }
  .table th {
    font-weight: bold;
  }
  .table a, .table button {
    color: blue;
  }
  .table a:hover {
    border-bottom: 1px solid blue;;
  }
</style>