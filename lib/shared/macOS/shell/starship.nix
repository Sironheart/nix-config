{ ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      aws.disabled = true;
      battery.disabled = true;
      buf.disabled = true;
      bun.disabled = true;
      c.disabled = true;
      cmake.disabled = true;
      cobol.disabled = true;
      cmd_duration = {
        min_time = 0;
        show_milliseconds = true;
      };
      conda.disabled = true;
      container.disabled = true;
      crystal.disabled = true;
      daml.disabled = true;
      dart.disabled = true;
      deno.disabled = true;
      directory = {
        truncation_length = 999;
        truncate_to_repo = false;
      };
      docker_context.disabled = true;
      dotnet.disabled = true;
      elixir.disabled = true;
      elm.disabled = true;
      env_var.disabled = true;
      erlang.disabled = true;
      fennel.disabled = true;
      fill.disabled = true;
      gcloud.disabled = true;
      golang.disabled = true;
      guix_shell.disabled = true;
      gradle.disabled = true;
      haskell.disabled = true;
      haxe.disabled = true;
      helm.disabled = true;
      hostname = {
        ssh_only = false;
      };
      java.disabled = true;
      julia.disabled = true;
      kotlin.disabled = true;
      line_break.disabled = true;
      localip = {
        ssh_only = true;
        disabled = false;
      };
      lua.disabled = true;
      meson.disabled = true;
      nim.disabled = true;
      nodejs.disabled = true;
      ocaml.disabled = true;
      opa.disabled = true;
      openstack.disabled = true;
      package.disabled = true;
      perl.disabled = true;
      php.disabled = true;
      pulumi.disabled = true;
      purescript.disabled = true;
      python.disabled = true;
      rlang.disabled = true;
      raku.disabled = true;
      red.disabled = true;
      ruby.disabled = true;
      rust.disabled = true;
      scala.disabled = true;
      singularity.disabled = true;
      solidity.disabled = true;
      spack.disabled = true;
      status.disabled = false;
      swift.disabled = true;
      terraform.disabled = true;
      vagrant.disabled = true;
      vlang.disabled = true;
      vcsh.disabled = true;
      zig.disabled = true;
    };
  };
}
