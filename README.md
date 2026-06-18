# my-nvim-set-up

개인 Neovim 설정입니다. [lazy.nvim](https://github.com/folke/lazy.nvim) 플러그인 매니저를 기반으로 구성되어 있으며, Neovim 0.11+ 의 네이티브 LSP API(`vim.lsp.enable`)와 네이티브 자동완성을 사용합니다.

## 요구 사항

- Neovim **0.11 이상** (네이티브 LSP / 자동완성 API 사용)
- `git`, `make`, C 컴파일러 (treesitter 파서 빌드용)
- [Nerd Font](https://www.nerdfonts.com/) (아이콘 표시용)
- 사용하려는 언어의 LSP 서버 (예: `lua_ls`)

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
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 구문 강조 / 파싱 (highlight, indent 활성화) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 설정 (네이티브 `vim.lsp.enable` 사용) |
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

## LSP 서버 추가

`lua/config/lsp.lua` 의 `servers` 테이블에 서버 이름을 추가하면 됩니다.

```lua
local servers = {
  "lua_ls",
  -- "pyright",
  -- "ts_ls",
  -- "rust_analyzer",
  -- "gopls",
  -- "clangd",
}
```

해당 LSP 서버 바이너리는 시스템에 별도로 설치되어 있어야 합니다.
