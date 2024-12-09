
{{- define "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.fullname" -}}
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


{{- define "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.labels" -}}
helm.sh/chart: {{ include "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.chart" . }}
{{ include "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8e3b5f8-e5e6-4c09-8809-b90a2bb34ade.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}