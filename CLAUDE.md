# 原則

ユーザーには日本語で応答してください。

## AIの行動指針
### 1. ワークフロー

- 些細ではないタスク（3ステップ以上、または設計上の決定を伴うもの）では、必ず superpowers プラグインを利用し、以下の「The Basic Workflow」 にしたがってタスクを進めること
- 何か問題が発生した場合は、無理に押し進めず、ただちに停止して計画を立て直すこと。

#### The Basic Workflow

1. **/brainstorming** - Activates before writing code. Refines rough ideas through questions, explores alternatives, presents design in sections for validation. Saves design document.
2. **/using-git-worktrees** - Activates after design approval. Creates isolated workspace on new branch, runs project setup, verifies clean test baseline.
3. **/writing-plans** - Activates with approved design. Breaks work into bite-sized tasks (2-5 minutes each). Every task has exact file paths, complete code, verification steps.
4. **/subagent-driven-development** or **/executing-plans** - Activates with plan. Dispatches fresh subagent per task with two-stage review (spec compliance, then code quality), or executes in batches with human checkpoints.
5. **/test-driven-development** - Activates during implementation. Enforces RED-GREEN-REFACTOR: write failing test, watch it fail, write minimal code, watch it pass, commit. Deletes code written before tests.
6. **/requesting-code-review** - Activates between tasks. Reviews against plan, reports issues by severity. Critical issues block progress.
7. **/finishing-a-development-branch** - Activates when tasks complete. Verifies tests, presents options (merge/PR/keep/discard), cleans up worktree.

**The agent checks for relevant skills before any task.** Mandatory workflows, not suggestions.


### 2. サブエージェント戦略

- メインのコンテキストウィンドウをクリーンに保つため、sub agent、agent teamを積極的に利用すること。
- 調査、探索、並行分析などのタスクはsub agentに依頼する。
- 複雑な問題に対しては、sub agentを通じてより多くの計算リソースを投入する。
- 実行を集中させるため、1つのsub agentにつき1つのタスクを割り当てる。

### 3. 情報の正確性

- 外部サービス、ライブラリが絡む設計・実装では必ずContext7もしくは、web検索で公式の最新情報を参照すること

### 4. 自己改善ループ

- ユーザーから修正・指摘を受けた後は、 auto memory にその教訓を記録すること。
- 教訓は一度記録して終わりではなく、抽象化し、本質的な教訓となるよう何度もブラッシュアップすること。
- セッション開始時に、関連プロジェクトの教訓を確認すること。

### 5. 完了前の検証

- 正しく動作していることを確認することなく、タスクを完了とマークしてはならない。
- 「スタッフエンジニアならこれを承認するか？」と自問自答すること。
- テストを実行し、ログを確認し、正確性を実証すること。

### 6. 美しいアーキテクチャの追求

- 美しいアーキテクチャとは長期間にわたって開発・運用・改善が容易であり、拡張に対して開かれており、修正に対して閉じられているものである。
- 技術負債となるようなアドホックな解決策を提示しない。アドホックだと感じたら、一度立ち止まって「より美しいアーキテクチャはないか」を考えること。
- 単純で明白な修正についてはオーバーエンジニアリングを避けること。
- 提示する前に、自分の成果を疑ってみること。

**設計の基本原則**
- **普遍的な設計原則への準拠**: Clean Architecture, DDD, TDD, SOLIDの原則, GoFデザインパターンといった普遍的な設計原則に準拠すること
- **深い洞察**: 表面的な問題の解決を目指すのではなく、問題の根本原因を見つけ、設計レベルでの改善が可能かを常に考えること
- **シンプル第一**: あらゆる変更を可能な限りシンプルにする。コードへの影響を最小限に抑える。
- **最小限の影響**: 必要な箇所だけに手を加える。バグの混入を避ける。
- **怠慢の禁止**: 現在の実装に引きずられたり、一時しのぎの修正を行わない。シニアディベロッパーの基準で長期的に運用・拡張が容易なアーキテクチャを目指すこと

### 7. 自律的なバグ修正

- バグ報告を受けたら、ログ、エラー、失敗したテストを特定し、原因究明と修正方針の策定までを自律的行うこと


### 8. ドキュメント執筆規約

- ドキュメンを執筆するときは `/japanese-tech-writing` スキルを必ず利用すること。


# 開発環境について

開発、デプロイはすべてDevContainer環境で行われます。

- .devcontainer/devcontainer.json で定義された設定でDevContainerが起動されます。環境変数やマウントポイントなどが含まれますので、必要に応じて参照してください。
- .devcontainer/Dockerfile で定義されたツールやライブラリを使用して、コード生成や設定作業を行ってください。

## チケットとソース管理について

- ソースコード・チケット(issue)は https://github.com/ng3rdstmadgke/devcontainer-template リポジトリで管理されます。
- ソースコード、チケット(issue)、マージリクエストなどへのアクセスは `gh` コマンドを利用してください。
- ブランチ名には `feature/チケット番号_xxxxxxxxx` のようなルールでチケット番号が含まれています。チケット情報を取得する際にはこのIDを使ってください
- コミットメッセージは原則 `ref #チケットID メッセージ` という形式になっており、コミットメッセージからファイルの変更に対応するチケットを特定することができます。