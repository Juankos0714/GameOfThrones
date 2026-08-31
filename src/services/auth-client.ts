/**
 * Auth client — lazy-loads better-auth only when authentication is needed.
 * Avoids bundling the 27KB better-auth library into the initial load.
 */

type AuthClient = ReturnType<typeof import('better-auth/vue').createAuthClient>

let _client: AuthClient | null = null

async function getClient(): Promise<AuthClient> {
  if (_client) return _client
  const { createAuthClient } = await import('better-auth/vue')
  _client = createAuthClient({
    baseURL: import.meta.env.VITE_AUTH_URL || 'http://localhost:3000',
  })
  return _client
}

/** Lazy signIn — only loads better-auth when called */
export async function signInEmail(email: string, password: string) {
  const client = await getClient()
  return client.signIn.email({ email, password })
}

/** Lazy signUp — only loads better-auth when called */
export async function signUpEmail(email: string, password: string, name: string) {
  const client = await getClient()
  return client.signUp.email({ email, password, name })
}

/** Lazy signOut — only loads better-auth when called */
export async function signOut() {
  const client = await getClient()
  return client.signOut()
}

/** Lazy useSession — only loads better-auth when called */
export async function getSession() {
  const client = await getClient()
  return client.getSession()
}
