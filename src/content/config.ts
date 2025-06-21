import { defineCollection, z } from 'astro:content';

const projectsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.string(),
    excerpt: z.string(),
    tags: z.array(z.string()).optional(),
    github: z.string().nullable().optional(),
    featured: z.boolean().optional().default(false),
  }),
});

export const collections = {
  'projects': projectsCollection,
}; 