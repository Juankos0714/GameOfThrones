/**
 * Auth service — thin wrapper around Better Auth Vue client.
 *
 * All server-side session validation happens in server/index.ts.
 * This module is only used from the browser.
 */
import { signInEmail, signUpEmail, signOut as lazySignOut } from './auth-client'

export async function signInWithEmail(email: string, password: string) {
  const { data, error } = await signInEmail(email, password)
  if (error) throw error
  return data
}

export async function signUpWithEmail(email: string, password: string) {
  const { data, error } = await signUpEmail(email, password, '')
  if (error) throw error
  return data
}

export async function signInWithMagicLink(email: string) {
  const { error } = await signInEmail(email, '')
  if (error) throw error
}

export async function signOut() {
  await lazySignOut()
}
