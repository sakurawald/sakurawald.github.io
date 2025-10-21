---
title: comparing-emacs-and-idea-in-java-development-environment
date: 2025-03-02 13:38:42
tags: 
  - emacs
  - ide
  - editor
  - tools
  - java
  - review
---

# Comparing the Emacs and Jetbrains Idea in Java Development environment.

## Background

The Emacs is a general purpose editor for all editing tasks, including Java. We configure the Emacs using `lsp-java` package with `jdtls server`.
The Jetbrains Idea is a feature-rich IDE for Java language.

## Why Emacs?

Picking Emacs for the following reasons:
1. Fully keyboard-driven development workflow. You can do window-switcting, buffer-swapping, cursor-jumping, mark-setting easily without a mouse.
2. Emacs has the best vi emulator named evil-mode, which is better than IdeaVim plugin in Jetbrains platform, and alternatives in vscode.
3. Fully customizable editor, the keymap in Emacs is easier and powerful, and it's also easy to compose a new command based on existing commands.
4. Has gradle project support, and it can integrate with lombok via adding a vmargs for jdtls server.

The weakness: 
1. Emacs is single-threaded, the async IO performance is poor. This is noticable while sending a lsp completion request. (Solution: use `lsp-bridge` package.)
2. Emacs is usable for pure Java development environment, for a specific framework project, like Minecraft Mod Development, still lacking the framework-supporting package. It's usable, but not sweet like Jetbrains Idea. (Solution: write it yourself man!)
3. Some sweet features is missing, like grep a text over all 3rd jar files in building environment. The workaround is to download a copy of sources of your 3rd files. (Solution: use `lsp-treemacs` pakcage and write the other functions based on lsp protocol.)
4. Better indexing for symbols in 3rd libraries. The de-compiler failed to de-compile some class files, causing the goto-reference failed. (Solution: use `cfr` de-compiler instead of the default `fernflower`.)

## Conclusion
Emacs wins for context-switching, text editing experience. 
Jetbrain Idea wins for async IO, better xref, rich framework-specific extension support.
