
{{- define "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.labels" -}}
helm.sh/chart: {{ include "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.chart" . }}
{{ include "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9a3d8d5-23aa-4fc7-a03d-cb354d6956fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}