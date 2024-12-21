
{{- define "go-echo0244cff9-4248-4c50-bb16-290747ede70b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0244cff9-4248-4c50-bb16-290747ede70b.fullname" -}}
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


{{- define "go-echo0244cff9-4248-4c50-bb16-290747ede70b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0244cff9-4248-4c50-bb16-290747ede70b.labels" -}}
helm.sh/chart: {{ include "go-echo0244cff9-4248-4c50-bb16-290747ede70b.chart" . }}
{{ include "go-echo0244cff9-4248-4c50-bb16-290747ede70b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0244cff9-4248-4c50-bb16-290747ede70b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0244cff9-4248-4c50-bb16-290747ede70b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}