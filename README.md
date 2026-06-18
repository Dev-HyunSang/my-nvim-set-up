# my-nvim-set-up

개인 Neovim 설정입니다. [lazy.nvim](https://github.com/folke/lazy.nvim) 플러그인 매니저를 기반으로 구성되어 있으며, Neovim 0.11+ 의 네이티브 LSP API(`vim.lsp.enable`)와 네이티브 자동완성을 사용합니다.

## 요구 사항

- Neovim **0.11 이상** (네이티브 LSP / 자동완성 API 사용)
- `git`, `make`, C 컴파일러 (treesitter 파서 빌드용)
- [Nerd Font](https://www.nerdfonts.com/) (아이콘 표시용)
- LSP 서버는 [mason.nvim](https://github.com/williamboman/mason.nvim)이 자동 설치하지만, 각 언어의 런타임/툴체인은 시스템에 있어야 합니다:
  - **Go** (`go`) — `gopls`
  - **Node.js** (`node`) — Python의 `pyright` 및 JS/TS의 `ts_ls` 구동에 필요
  - **Python** (`python3`) — `pyright`로 타입 체크할 인터프리터

## 설치

```bash
git clone https://github.com/Dev-HyunSang/my-nvim-set-up ~/.config/nvim
nvim
```

최초 실행 시 `lazy.nvim` 이 자동으로 부트스트랩되고 플러그인이 설치됩니다.

## 디렉터리 구조

```
.
├── init.lua                 # 진입점 (options → keymaps → lazy 순으로 로드)
├── lazy-lock.json           # 플러그인 버전 고정(lockfile)
└── lua/
    ├── config/
    │   ├── options.lua      # 에디터 기본 옵션 & leader 키
    │   ├── keymaps.lua      # 전역 단축키
    │   ├── lazy.lua         # lazy.nvim 부트스트랩 & 셋업
    │   └── lsp.lua          # LSP 서버 활성화 & LSP 단축키
    └── plugins/
        ├── init.lua         # 플러그인 명세
        └── neotree.lua      # neo-tree 파일 탐색기 설정
```

## 설치된 플러그인

| 플러그인 | 설명 |
| --- | --- |
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 플러그인 매니저 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 구문 강조 / 파싱 (go, python, js/ts 등 파서 자동 설치) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 설정 (네이티브 `vim.lsp.enable` 사용) |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 서버/도구 설치 관리자 |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | mason ↔ lspconfig 연동 (서버 자동 설치/활성화) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 상태줄(statusline) |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 파일 탐색기 |
| [tagbar](https://github.com/preservim/tagbar) | 태그/심볼 브라우저 |
| [neogit](https://github.com/NeogitOrg/neogit) | Git 인터페이스 |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff 뷰어 |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | 파일 타입 아이콘 |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | 공통 Lua 유틸 (neogit/neo-tree 의존성) |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim) | UI 컴포넌트 (neo-tree 의존성) |

> 정확한 고정 버전은 [`lazy-lock.json`](./lazy-lock.json) 을 참고하세요.

## 단축키

`leader` 키는 **스페이스바(`<Space>`)**, `localleader` 는 **`\`** 입니다.

### 전역

| 키 | 동작 |
| --- | --- |
| `<F7>` | Neo-tree 파일 탐색기 토글 |
| `<F8>` | Tagbar 토글 |
| `<leader>e` | Neo-tree 파일 탐색기 토글 |

### LSP (LSP 서버가 버퍼에 attach 되면 활성화)

| 키 | 동작 |
| --- | --- |
| `gd` | 정의로 이동 (Goto Definition) |
| `gD` | 선언으로 이동 (Goto Declaration) |
| `gr` | 참조 목록 (References) |
| `gi` | 구현으로 이동 (Goto Implementation) |
| `K` | Hover 문서 표시 |
| `<leader>rn` | 심볼 이름 변경 (Rename) |
| `<leader>ca` | 코드 액션 (Code Action) |
| `<leader>f` | 버퍼 포맷 |
| `[d` | 이전 진단(diagnostic)으로 이동 |
| `]d` | 다음 진단(diagnostic)으로 이동 |

## 주요 옵션

- 절대/상대 줄 번호(`number` + `relativenumber`)
- 시스템 클립보드 연동(`clipboard = unnamedplus`)
- 트루컬러(`termguicolors`)
- 들여쓰기: 스페이스 2칸(`expandtab`, `shiftwidth=2`, `tabstop=2`)
- 검색: `ignorecase` + `smartcase`, `hlsearch`, `incsearch`
- UI: `cursorline`, `signcolumn=yes`, `scrolloff=8`, 분할은 오른쪽/아래로

## 언어 지원 (LSP)

기본으로 아래 언어가 바로 동작합니다. 해당 파일을 열면 mason이 서버를 자동 설치하고 LSP가 attach됩니다.

| 언어 | LSP 서버 |
| --- | --- |
| Lua | `lua_ls` |
| Go | `gopls` |
| Python | `pyright` |
| JavaScript / TypeScript | `ts_ls` |

설치 상태는 `:Mason` 명령으로 확인/관리할 수 있습니다.

### LSP 서버 추가

`lua/config/lsp.lua` 의 `servers` 테이블에 서버 이름을 추가하고,
`lua/plugins/mason.lua` 의 `ensure_installed` 에도 동일하게 추가하면 자동 설치됩니다.

```lua
-- lua/config/lsp.lua
local servers = {
  "lua_ls",
  "gopls", -- Go
  "pyright", -- Python
  "ts_ls", -- JavaScript / TypeScript
  -- "rust_analyzer",
  -- "clangd",
}
```
