<script>

import Icon from "./Icon.svelte";

</script>

<div class="quick-browse">

  <div class="search" style="display: flex">
    <Icon icon="plane" size="1.3rem" />
    <input placeholder="Quick Browse">
  </div>

  <div class="status-suggestions">
    <div class="status">Status</div>
    <div class="suggestions">
      <a href="/accounts/bank-al-habib">Bank Al Habib</a>
      <a href="/accounts/habib-metro">Habib Metro</a>
      <a href="/accounts/bank-al-habib">Bank Al Habib</a>
      <a href="/accounts/habib-metro">Habib Metro</a>
    </div>
  </div>

</div>

<style>
  .quick-browse {
    display: grid;
    position: relative;
  }
  .search {
    display: flex;
    gap: 10px;
    border: var(--border);
    padding-left: 10px;
  }
  input {
    border: none;
    padding: var(--padding);
    padding-left: 0;
  }
  .status-suggestions {
    top: 35px;
    position: absolute;
    display: grid;
    width: 100%;
  }
  .status {
    font-size: 0.9rem;
    background-color: rgb(231, 231, 231);
    padding: 4px 15px;
    border: var(--border);
  }
  .suggestions {
    box-shadow: 5px 5px 5px 0 rgba(181, 181, 181, 0.7);
    display: grid;
    background-color: #fff;
    /* padding: var(--padding); */
    border: var(--border);
    border-top: none;
    border-bottom: none;
  }
  .suggestions a {
    padding: var(--padding);
    border-bottom: var(--border);
  }
</style>