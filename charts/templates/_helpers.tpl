
{{- define "go-echod44605ac-5731-4523-8196-364d08809663.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod44605ac-5731-4523-8196-364d08809663.fullname" -}}
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


{{- define "go-echod44605ac-5731-4523-8196-364d08809663.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod44605ac-5731-4523-8196-364d08809663.labels" -}}
helm.sh/chart: {{ include "go-echod44605ac-5731-4523-8196-364d08809663.chart" . }}
{{ include "go-echod44605ac-5731-4523-8196-364d08809663.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod44605ac-5731-4523-8196-364d08809663.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod44605ac-5731-4523-8196-364d08809663.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}