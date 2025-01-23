
{{- define "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.fullname" -}}
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


{{- define "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.labels" -}}
helm.sh/chart: {{ include "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.chart" . }}
{{ include "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3a81465-e1a5-4e41-a0f5-b70ce6a5771a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}