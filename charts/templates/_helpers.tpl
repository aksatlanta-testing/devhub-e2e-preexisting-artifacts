
{{- define "go-echoc8013030-d167-4810-85d7-2952df8466ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8013030-d167-4810-85d7-2952df8466ac.fullname" -}}
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


{{- define "go-echoc8013030-d167-4810-85d7-2952df8466ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8013030-d167-4810-85d7-2952df8466ac.labels" -}}
helm.sh/chart: {{ include "go-echoc8013030-d167-4810-85d7-2952df8466ac.chart" . }}
{{ include "go-echoc8013030-d167-4810-85d7-2952df8466ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8013030-d167-4810-85d7-2952df8466ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8013030-d167-4810-85d7-2952df8466ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}