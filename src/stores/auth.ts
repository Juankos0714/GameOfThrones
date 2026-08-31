import { create } from 'vue-zustand'

interface AuthUser {
  id: string
  email: string
  role: 'viewer' | 'editor' | 'admin'
  name?: string
}

interface AuthState {
  user: AuthUser | null
  loading: boolean
  error: string | null
  isAuthenticated: boolean
  isAdmin: boolean
  isEditor: boolean
  setUser: (user: AuthUser | null) => void
  setLoading: (value: boolean) => void
  setError: (error: string | null) => void
  clearAuth: () => void
}

export const useAuthStore = create<AuthState>((set, get) => ({
  user: null,
  loading: false,
  error: null,

  get isAuthenticated() {
    return get().user !== null
  },

  get isAdmin() {
    return get().user?.role === 'admin'
  },

  get isEditor() {
    const user = get().user
    return user?.role === 'editor' || user?.role === 'admin'
  },

  setUser: (user: AuthUser | null) => set({ user, error: null }),

  setLoading: (value: boolean) => set({ loading: value }),

  setError: (error: string | null) => set({ error }),

  clearAuth: () => set({ user: null, error: null }),
}))
