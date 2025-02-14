
{{- define "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.fullname" -}}
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


{{- define "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.labels" -}}
helm.sh/chart: {{ include "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.chart" . }}
{{ include "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo02a9abac-ebb1-42ea-8ebf-0a54cf140682.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}