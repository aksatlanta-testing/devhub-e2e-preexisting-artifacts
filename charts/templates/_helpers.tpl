
{{- define "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.fullname" -}}
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


{{- define "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.labels" -}}
helm.sh/chart: {{ include "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.chart" . }}
{{ include "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod55cd782-17b5-4f21-9a75-5e2e98993d54.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}