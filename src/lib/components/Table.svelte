<table class="table">
  <slot></slot>
</table>

<style global>
  .table {
    border-collapse: collapse;
    white-space: nowrap;
    margin-bottom: 40px;
  }
  .table th, .table td {
    border: var(--border);
    padding: var(--padding);
  }
  .table th {
    font-weight: bold;
  }
  .table tr:hover {
    background-color: rgb(225, 245, 255);
  }
  .table .main {
    width: 100%;
  }
  .table a {
    color: blue;
  }
  .table a:hover {
    color: red;
  }
</style>