
{{- define "go-echob8762cff-0890-400d-877a-f1c2000e4feb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8762cff-0890-400d-877a-f1c2000e4feb.fullname" -}}
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


{{- define "go-echob8762cff-0890-400d-877a-f1c2000e4feb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob8762cff-0890-400d-877a-f1c2000e4feb.labels" -}}
helm.sh/chart: {{ include "go-echob8762cff-0890-400d-877a-f1c2000e4feb.chart" . }}
{{ include "go-echob8762cff-0890-400d-877a-f1c2000e4feb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob8762cff-0890-400d-877a-f1c2000e4feb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob8762cff-0890-400d-877a-f1c2000e4feb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}