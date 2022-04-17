<table class="table">
  <slot></slot>
</table>

<style global>
  .table {
    border-collapse: collapse;
    white-space: nowrap;
    margin-bottom: 40px;
  }
  th, td {
    border: var(--border);
    padding: var(--padding);
  }
  th {
    font-weight: bold;
  }
  tr:hover {
    background-color: rgb(225, 245, 255);
  }
  .table .main {
    width: 100%;
  }
</style>