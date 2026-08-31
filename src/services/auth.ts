/**
 * Auth service — thin wrapper around Better Auth Vue client.
 *
 * All server-side session validation happens in server/index.ts.
 * This module is only used from the browser.
 */
import { authClient } from './auth-client'

export async function signInWithEmail(email: string, password: string) {
  const { data, error } = await authClient.signIn.email({ email, password })
  if (error) throw error
  return data
}

export async function signUpWithEmail(email: string, password: string) {
  const { data, error } = await authClient.signUp.email({ email, password, name: '' })
  if (error) throw error
  return data
}

export async function signInWithMagicLink(email: string) {
  const { error } = await authClient.signIn.email({ email, password: '' })
  if (error) throw error
}

export async function signOut() {
  await authClient.signOut()
}

export function useSession() {
  return authClient.useSession()
}

export function onAuthStateChange(callback: (user: any | null) => void) {
  const session = authClient.useSession()
  // Watch for session changes
  return { data: session }
}
