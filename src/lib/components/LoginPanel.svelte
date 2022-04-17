<script>
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  import Field from "./Field.svelte";
  import Title from "./Title.svelte";
</script>

<div class="wrapper">

  <div class="login">
    <Title text="Login" />
    <Field label="Username" />
    <Field label="Password" class="mb-20" />
    <ButtonGroup>
      <Button type="primary" text="Login" />
      <Button text="Forgot Password?" />
    </ButtonGroup>
    <div>Not registered yet? <a href="/register">Register</a></div>
  </div>
  
</div>

<style>
  .wrapper {
    position: absolute;
    top: 0; left: 0;
    width: 100%;
    height: 100%;
    display: grid;
    place-items: center;
  }
  .login {
    background-color: #fff;
    padding: 35px;
    border: var(--border);
    border-radius: 10px;
    width: 400px;
    row-gap: 20px;
    display: grid;
  }
</style>