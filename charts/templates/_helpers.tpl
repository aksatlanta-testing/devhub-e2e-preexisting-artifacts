
{{- define "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.fullname" -}}
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


{{- define "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.labels" -}}
helm.sh/chart: {{ include "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.chart" . }}
{{ include "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3083c9a5-46fd-4b3d-b2f2-c6cb8c0ff79c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}