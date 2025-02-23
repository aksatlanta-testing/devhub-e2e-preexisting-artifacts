
{{- define "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.fullname" -}}
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


{{- define "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.labels" -}}
helm.sh/chart: {{ include "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.chart" . }}
{{ include "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeea3221d-f565-448f-a0b4-7c9594e16f19.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}