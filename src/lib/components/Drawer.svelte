<div class="drawer">
  <slot></slot>
</div>

<style>
  .drawer {
    border-right: var(--border);
    position: fixed; 
    top: 0; left: 0;
    background-color: #fff;
    width: 200px;
    height: 100%;
    box-shadow: 5px 0 5px 0 rgba(146, 146, 146, 0.5);
    padding-top: 50px;
  }
</style>